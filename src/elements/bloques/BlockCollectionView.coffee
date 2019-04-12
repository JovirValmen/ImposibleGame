Collection = require './BlockCollection'
ItemView = require './BlockItemView'

class BlockCollectionView extends PIXI.Graphics
    collection: Collection
    constructor: (app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @app.addAnimationNodes(@)
        @radio = app.radio
        @buildItemViews()

    buildItemViews: =>

        for model in @collection
            new ItemView(model, @)

    animate:()=>


module.exports = BlockCollectionView