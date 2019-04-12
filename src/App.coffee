mathjs = require('mathjs')
DataRectangle = require('./data/rectangles')
Rectangle = require('./elements/Rectangle')
DataTriangle = require('./data/triangles')
DataInvisibles = require('./data/invisibles')
Triangle = require('./elements/Triangle')
Stage = require('./data/stage')
Bg = require('./elements/backgrounds/Bg')
BgFile = require('./assets/bckgds/BgFile.png')
BgFile2 = require('./assets/bckgds/BgFile2.png')
BgFile3 = require('./assets/bckgds/BgFile3.png')
audio = require('./assets/ost.mp3')
Hero = require('./elements/Hero')
Enemy = require('./elements/Enemy')
DataEnemies = require('./data/enemies')
sound = require 'Howler'
Blocks = require('./elements/bloques/BlockCollectionView')
Radio = require 'nanoevents'
Deadpool = require('./elements/Invisible')

class App extends PIXI.Application
  animation: true
  animationNodes: []
  rectangles: []
  triangles: []
  enemies: []
  invisibles: []
  myStage: Stage
  hero: null
  enemy: null
  radio: new Radio()
  constructor: (w, h, o) ->
    super(w, h, o)
    document.body.appendChild @view
    @preload()


  preload: () =>
    PIXI.loader.add(BgFile).load(@build).load(@animate)

  play: ->
    sound = new sound.Howl(
      {
        src: ['images/ost.mp3']
        autoplay: true
        loop: true
      }
    )
    sound.play()
    null

  build: =>
#    @play()

    @Bg = new Bg (BgFile3)
    @Bg2 = new Bg (BgFile2)

    container = new PIXI.Container
    container.addChild(@Bg2)
    container.addChild(@Bg)
    @stage.addChild container

    @block = new Blocks(@)
    @block.y = 0

    @hero = new Hero(0xFFFF00, 0, 0, 15, 15, 0, @)
    @hero.x = 10
    @hero.y = 530
    @addAnimationNodes @hero
    @stage.addChild @hero

#    for s in DataRectangle
#      rectangle = new Rectangle(s, @)
#      @stage.addChild(rectangle)
#      @rectangles.push(rectangle)

    for t in DataTriangle
      triangle = new Triangle(t, @)
      @stage.addChild(triangle)
      @triangles.push(triangle)

    for e in DataEnemies
      enemy = new Enemy(e, @)
      @stage.addChild(enemy)
      @enemies.push(enemy)

    @win = new Deadpool(@)
    @win.x = 20
    @win.y = 120
    @win.alpha = 1
    @stage.addChild @win

  collision: (player, obj) ->
    if (player.x < obj.x + obj.width && player.x + player.width > obj.x && player.y < obj.y + obj.height && player.height + player.y > obj.y)
      @win.alpha = 0
      @win.x = 0
      @win.y = 0
      alert("¡Ganaste!")

  addAnimationNodes: (child) =>
    @animationNodes.push child
    null

  animate: =>
    @ticker.add (evt) =>
      @hero.Die(@enemies)
      @collision(@hero, @win)
      for n in @animationNodes
        n.animate?()

    null

module.exports = App