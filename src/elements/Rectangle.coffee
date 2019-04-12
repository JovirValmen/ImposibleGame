class Rectangle extends PIXI.Graphics

    dir: 1
    dropDown: false
    alpha: 1

    constructor: (s, app) ->
        super()
        @app = app
        @data = s
        @beginFill(@data.color)
        @lineStyle(1, @data.color)
        @drawRect(0, 0, @data.width, @data.height, @alpha)
        @x = @data.x
        @y = @data.y
        @alpha = 1
        @collision = @data.collision
        @endFill()

module.exports = Rectangle