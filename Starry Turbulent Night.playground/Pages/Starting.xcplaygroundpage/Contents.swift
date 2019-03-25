import PlaygroundSupport
import SpriteKit
/*:
 ## Starry Turbulent Night
 _ _ _
 Clouds, sea waves, smoke, and river flows, they have at least one thing in common; __Turbulence!__
 
 * Callout(Textbooks *boringly* define it as:):
 A flow condition in which local speed and pressure change unpredictably as an average flow is maintained.
 _ _ _
 As boring as that description might sound, it is actually a fascinating phenomena. Because of its captivating characteristic, many artists have depicted turbulence in aesthetic ways. And using just codes, we can do it as well. In this playground we are going to explore the nature of `randomness`, `noise`, and `turbulence` and even create our own **turbulence-based artworks**!
 _ _ _
 */
//: ### Start exploring by running the function below
startExploration()
//: _ _ _
/*:
 ## Random VS Noise
 _ _ _
 There are several ways to simulate turbulent flow in our screen. But first let's return to that seemingly dull explanation and highlight one thing:
 - "A flow condition in which local speed and pressure change _unpredictably_ ..."
 
 Briefly speaking, it's random! So, why don't we just depict randomness by splodging random black and white color to screen and hopefully we'll get a turbulent flow.
 > Simply click the __Random__ button
 _ _ _
 Does it look flowy to you? 🤔 Well, it doesn't for me. This is because nature has a special type of randomness where one value, movement, or force will influence the next ones. Therefore, pure random function that generates values without context is not enough. At this point you might have clicked the __Noise__ button and see what happens.
 > Try out the __Noise__ button too
 
 In short, noise generate random values as well, but unlike the usual random function, every value in the space influences the value arround it. It is considerably similar to what's going on in nature 🍃
 _ _ _
 */
/*:
 ## Getting Our Hands Dirty
 _ _ _
 * Callout(Start Drawing):
 Now comes the fun part, let's depart from this verbose theory and start painting using particles and turbulent movements!
 [Next Page](@next)
 */
//: _ _ _
/*:
 ### Resources & References:
 * [[1]](https://commons.wikimedia.org/wiki/File:Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg) Vincent van Gogh - The Starry Night (public domain image)
 * [[2]](https://www.youtube.com/watch?v=8ZEMLCnn8v0) Daniel Shiffman - Perlin Noise
 */

