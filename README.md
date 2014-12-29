# Swift Pipeline Operator

Pipeline is a custom Swift infix operator for defining a series of transformations to be performed on some initial input in a readable and logical way.

You can learn more about why I built this by checking out the accompanying blog post, [Writing a pipeline operator in Swift](http://gilesvangruisen.com/writing-a-pipeline-operator-in-swift/).

## How does it work? 

`-->` is an infix operator that takes an optional on the left and a function on the right. The function on the right takes an optional of the same type as that on the left of the operator. Ultimately the operator returns the result of the function on the right, if any exists. Let's see an example!

## Example

Maybe I want to load an image from a URL in a string and ultimately shove it into a `UIImageView`. Traditionally, the safest way to do this in swift would be the following:

```Swift
// assume imageURLString defined
if let imageURL = NSURL(string: imageURLString) {
    if let imageData = NSData(contentsOfURL: imageURL) {
        if let image = UIImage(data: imageData) {
            let imageView = UIImageView(image: image)
        }
    }
}
```

However, this is ugly and not very approachable. With the pipeline operator, we can write the following without losing any safety whatsoever:

```Swift
// assume imageURLString defined
let imageView = imageURLString
    --> { NSURL(string: $0) }
    --> { NSData(contentsOfURL: $0) }
    --> { UIImage(data: $0) }
    --> { UIImageView(image: $0) }
```

Isn't that lovely.

### "Pinch me, I'm (pipe) dreaming!"

Not so! This is real life.


## Multiple arguments and return types

Believe it or not, the pipeline operator isn't limited to single argument or single return type functions. In Swift, you can pass a tuple to a function and it will act as that functions ordered arguments. By defining a function that returns a tuple and another function that takes two arguments, we can pipe the result of the former to the latter.

### Example:

```Swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    // returns tuple containing `array`'s minimum and maximum values
}
 
func range(min: Int, max: Int) -> Int {
    // returns absolute difference between min and max
}
 
let ages = [18, 20, 21, 21, 22, 24, 27, 29]
ages
    --> minMax // returns (min: 18, max: 29)
    --> range // returns 11
    --> println // prints 11
```



