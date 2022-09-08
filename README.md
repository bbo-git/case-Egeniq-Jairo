# case-Egeniq
 
The problem for this assignment is that we are using an API with thousands of items.
In order to face this challenge I have a few things in mind:

- I will use the MVC (Model View Controller) design pattern
- The interface will try to keep getting new images when coming to the end of the fetched list
- If I have time I want to write one or two tests
- To display the cat images I will use the library SDImage, that I have used in the past (It's great)

The user interface will be like a photo album with a small info bubbel on top, I might do some cell drawing animations.
A loading indicator will be present while the image loads.

Since I never implemented an infinite scroller, I am reading up on UICollectionViewDataSourcePrefetching. My steps will be to first implement the nessecary views, viewcontroller and network code and then add the prefetching logic.

Because of the time constraint, in stead of using pseudo code I am using some classes from:

https://www.raywenderlich.com/5786-uitableview-infinite-scrolling-tutorial

Some afterthoughts:

I managed to finish the case in roughly 3 hours. 
The code isn't thoroughly tested due to time constraints.
I didn't have the time to animate anything.
There is no loading animation.
Although I was intending to use MVC, there is a viewmodel class.
I never implemented an infinite scoller, I would never have made it in time figuring out how to do it by myself.
I'm hoping that using some existing code I haven't violated the case terms.
This was a great learning experience.

*fingers crossed*

Happy reviewing!! :)
