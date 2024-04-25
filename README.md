# iosFinalProject
Welcome to MyStle, your very own virtual closet! 

Course Concept 1 (Persistent Data Storage):
- We use CoreData to keep track of different clothing items. Each ClothingItem entity contains the following attributes: image, type, color, and price. We interact with CoreData by adding, deleting, and fetching existing entries.

Course Concept 2 (Advanced Topic):
- We use VisionKit to lift the clothing objects from their background. We also have a CameraView that requests permission from the user, takes an image, then passes the image to our functions utilizing VisionKit for extra processing. Isolating the individual clothing item adds to the illusion that the app represents the user's closet.

Our app architecture is intiutive; we our views include a Camera/Scanner view, a Closet View, and a Clothing Item View that is represented as a modal when the user clicks into a specific photo. We have one ViewModel file which deals with CoreData storage. Our app works as expected with no noticable bugs, and it is ready for the App Store, as it has an app icon and a purpose string for Camera permissions.
