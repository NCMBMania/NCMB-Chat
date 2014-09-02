$ ->
  chatLogic =
    __name: "ChatLogic"
    MessageClass: ->
      NCMB.Object.extend("MessageClass")
    getData: ->
      dfd = this.deferred()
      query = new NCMB.Query(this.MessageClass())
      query.descending("createDate")
      query.find
        success: (data) ->
          dfd.resolve(data)
        error: (data) ->
          dfd.reject(data)
      dfd.promise()
    postData: (params) ->
      dfd = this.deferred()
      message = new (this.MessageClass())
      message.set params
      message.save
        success: (message) ->
          dfd.resolve(message)
        error: (message, error) ->
          dfd.reject(error)
      dfd.promise()
  h5.core.expose(chatLogic);
