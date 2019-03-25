import PlaygroundSupport
import SpriteKit
var myPaintingPrefs = PaintingPreference()
/*:
 # Turbulent Painting Scene
 _ _ _
This scene allows you to create captivating generative arts by simply changing tiny bits of code. Be aware that even the smallest change may result in an unimaginable differences.
  ### **Tweak, run, and be mesmerised by your own turbulent creations!**
> Run the whole page first to see what's going on, then you may customize the code as you like. 😉
 _ _ _
 */
//: ## Properties
/*:
 * Callout(colors):
    As its name dicates, this property defines the color(s) of the painter particles. You can mix a multitude of colors to create rainbowy turbulence or carefully craft your palette.
 */
myPaintingPrefs.colors =  [#colorLiteral(red: 0.007843137255, green: 0.09411764706, blue: 0.3490196078, alpha: 1), #colorLiteral(red: 0.06666666667, green: 0.1882352941, blue: 0.5490196078, alpha: 1), #colorLiteral(red: 0.2666666667, green: 0.3960784314, blue: 0.6509803922, alpha: 1), #colorLiteral(red: 0.2588235294, green: 0.4156862745, blue: 0.5490196078, alpha: 1), #colorLiteral(red: 0.8509803922, green: 0.7098039216, blue: 0.2901960784, alpha: 1)]
/*:
 * Callout(bgColor):
 This is the color of your canvas. Experiment to find the best color that matches with your particles colors.
 */
myPaintingPrefs.bgColor = #colorLiteral(red: 0.007843137255, green: 0.05599157685, blue: 0.1663622876, alpha: 1)
/*:
 * Callout(particleSize):
 This one should be obvious. It is the size of the painter particles. The size may get so big but not too big. Since it's in percent keep it between (1-100).
 */
myPaintingPrefs.particleSize = 1
/*:
 * Callout(sizeChange):
 It is the dynamic of the particle size. Just in case you are bored with plain uniform ones. One little trick, use negative value to make the particle with smaller tail.
 */
myPaintingPrefs.sizeChange = 0
/*:
 * Callout(length):
 This determines the length of the particle. Its value is also in percent (1-100).
 */
myPaintingPrefs.length = 30
//: ## Advanced Settings
//: Tinkering with this values may result in erratic unexpected movements, it is both bewildering and fun to observe.
//: > To dig deeper about these concepts, I highly recommend Apple's documentation on [GKNoiseSource](https://developer.apple.com/documentation/gameplaykit/gknoisesource) and [this article](https://flafla2.github.io/2014/08/09/perlinnoise.html).
/*:
 * Callout(seed):
 Seed is the source of randomness of the noise space. Basically, to generate different noise space you can simply change the seed value.
 */
myPaintingPrefs.seed = Int32("WWDC".count)
/*:
 * Callout(freq):
 freq or frequency determines feature of the noise field. Larger number results in more complex structure of and causing more jagged movements of the particles.
 */
myPaintingPrefs.freq = 1.4
/*:
 * Callout(octave):
 Noise field is actually composed of multiple noises added together. The number of noises involved in the creation are called octaves. Thus, the more octaves we have, the moore complex the noise becomes.
 */
myPaintingPrefs.octave = 3
/*:
 * Callout(lacunarity and persistence):
    In the process of combining octaves there will be changes in frequency and amplitude. Lacunarity is responsible for the frequency and persistence is for the amplitude.
 */
myPaintingPrefs.lacunarity = 1
myPaintingPrefs.persistance = 0.2


startPainting(with: myPaintingPrefs)

//: _ _ _
/*:
 ### Resources & References:
 * [[1]](https://developer.apple.com/documentation/gameplaykit/gknoisesource) Apple Developer Documentation - GKNoiseSource
*/
