gsap = require 'gsap'

class Enemy extends PIXI.Graphics

    dir: 1
    dropDown: false
    alpha: 1
    move: false

    constructor: (s, app) ->
        super()
        @app = app
        @data = s
        @beginFill(@data.color, @data.alpha)
        @drawRect(0, 0, @data.width, @data.height)
        @x = @data.x
        @y = @data.y
        @alpha = 1
        @endFill()
        @goTo()
#        @returnTo()
#        @onMove()

#    onMove: () =>
#        if @move is true
#            @goTo()
#        else
#            @returnTo()

    goTo: () =>
        @move = true
        @destinyA = @data.destinyA
        @destinyB = @data.destinyB
        gsap.TweenMax.to @, 0.5, {x: @destinyA, y:@destinyB, repeat: -1, yoyo: true},
#            x: @destinyA

#    returnTo: () =>
#        @move = false
#        if @x = @destinyA
#            @destinyB = @data.destinyB
#            gsap.TweenMax.to @, 1,
#                x: @destinyB

module.exports = Enemy