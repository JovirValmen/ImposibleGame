class Rectangle extends PIXI.Graphics

    dir: 1
    dropDown: false

    constructor: (s, app) ->
        super()
        @app = app
        @data = s
        @beginFill(@data.color)
        @lineStyle(1, @data.color)
        @drawRect(0, 0, @data.width, @data.height)
        @x = @data.x
        @y = @data.y
        @endFill()

module.exports = Rectangle