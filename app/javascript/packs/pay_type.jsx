import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
// import PayTypeSelector from 'PayTypeSelector'


const Payment = props => (
  <div>Hello customer {props.name}!</div>
)

Payment.defaultProps = {
  name: 'David'
}

Payment.propTypes = {
  name: PropTypes.string
}

document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(
    <Payment name="Pay Type" />,
    document.body.appendChild(document.createElement('h1')),
  )
})
