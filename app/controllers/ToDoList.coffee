utils = require(process.cwd() + '/core/utils')


exports.view = (dom, callback) ->
    utils.bind(dom, '.item', (node) ->
        node.innerHtml = "thing one"
        node

    )
