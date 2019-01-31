# CoreDataAdapter

A generic wrapper making work with CoreData easier. I took an inspiration to create this adapter while reading objc's book: CoreData.

## Example

```swift
// Model
final class Dog: NSManagedObject, Managed {
    @NSManaged var birthDate: Date
    @NSManaged var name: String
}

let coreDataAdapter = CoreDataAdapter()

// Fetching results
let dogs: [Dog] = coreDataAdapter.fetch()

// Creating objects
coreDataAdapter.createManagedObject(type: Flashcard.self) { dog in
    dog.birthDate = Date()
    dog.name = "Rex"
}

// Removing objects
let dogToDelete = dogs[0]
coreDataAdapter.deleteManagedObject(dogToDelete) {
    if let error = error {
        // error
    } else {
        // success
    }
}
```

## To do

- [ ] Edit objects
- [ ] Better error handling

## Requirements

- Swift 4.2+
- iOS 10+
- Xcode 10+

## License

CoreDataAdapter is available under the MIT license. See the LICENSE file for more info.
