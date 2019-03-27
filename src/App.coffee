mathjs = require('mathjs')
DataRectangle = require('./data/rectangles')
Rectangle = require('./elements/Rectangle')
Stage = require('./data/stage')
Bg = require('./elements/backgrounds/Bg')
BgFile = require('./assets/bckgds/BgFile.png')
BgFile2 = require('./assets/bckgds/BgFile2.png')
audio = require('./assets/ost.mp3')
Hero = require('./elements/Hero')
sound = require 'Howler'

class App extends PIXI.Application
  animation: true
  animationNodes: []
  rectangles: []
  myStage: Stage
  hero: null
  constructor: (w, h, o) ->
    super(w, h, o)
    document.body.appendChild @view
    window.addEventListener 'keypress', @onKeyPress
    window.addEventListener 'keyup', @onKeyUp
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

  onKeyPress: (evt) =>
    if evt.key is 'd'
      @hero.x += 3

    if evt.key is 'a'
      @hero.x -= 3

    if evt.key is 'w'
      @hero.gravitySpeed = -6

  onKeyUp: (evt) =>
    if evt.key is 'd'
      null

    if evt.key is 'a'
      null

    if evt.key is 'w'
      null


  build: =>
#    @play()

    @Bg = new Bg (BgFile)
    @Bg2 = new Bg (BgFile2)

    container = new PIXI.Container
    container.addChild(@Bg2)
    container.addChild(@Bg)
    @stage.addChild container

    @hero = new Hero(0xFF0040, 0, 0, 15, 15, 0)
    @hero.x = 20
    @hero.y = 500
    @addAnimationNodes @hero
    @stage.addChild @hero

    for s in DataRectangle
      rectangle = new Rectangle(s, @)
      @stage.addChild(rectangle)
      @rectangles.push(rectangle)

  collision: (player, arr) ->
    for n in arr
      if (player.x < n.x + n.width && player.x + player.width > n.x && player.y < n.y + n.height && player.height + player.y > n.y)
        console.log 'chocaste!'
        @hero.gravitySpeed = -@hero.gravity
      else
        @hero.gravity = 0.6


  addAnimationNodes: (child) =>
    @animationNodes.push child
    null

  animate: =>
    @ticker.add (evt) =>
      @collision(@hero, @rectangles)
      for n in @animationNodes
        n.animate?()

    null

module.exports = App