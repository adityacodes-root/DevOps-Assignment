import { render } from '@testing-library/react'
import Home from '../pages/index'
import '@testing-library/jest-dom'

describe('Home Snapshot', () => {
  it('matches snapshot', () => {
    const { container } = render(<Home apiBaseUrl="http://localhost:8000" />)
    expect(container).toMatchSnapshot()
  })
})
