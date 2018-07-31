import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'

export default (
  actionCreatorsBinder = bindActionCreators
  dispatcher
) =>

  (getState, actions, Component) =>

    connect(

      (state) ->
        state: getState state

      (dispatch) ->
        dispatcher or= dispatch
        actions:
          actionCreatorsBinder actions, dispatcher

    ) Component
