gsap = require 'gsap'

class Invisible extends PIXI.Graphics

    move: false

    constructor: (app) ->
        super()
        @app = app
        @beginFill(0xffffff, @alpha)
        @drawRect(0, 0, 10 , 10)
        @endFill()
        @animate()

    animate: () =>
        @move = true
        gsap.TweenMax.to @, 0.5, { x: 20, y:100, repeat: -1, yoyo: true },

module.exports = Invisible