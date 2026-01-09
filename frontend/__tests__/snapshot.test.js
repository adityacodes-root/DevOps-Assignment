import { render } from '@testing-library/react'
import Home from '../pages/index'
import '@testing-library/jest-dom'

describe('Home Snapshot', () => {
  it('matches snapshot', () => {
    const { container } = render(<Home />)
    expect(container).toMatchSnapshot()
  })
})
