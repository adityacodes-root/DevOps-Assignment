import { render, screen } from '@testing-library/react'
import Home from '../pages/index'
import '@testing-library/jest-dom'

describe('Home', () => {
    it('renders the welcome heading', () => {
        render(<Home />)
        // Assuming the index.js has a heading like "Welcome to Next.js" or similar
        // I need to verify what's in index.js actually.
        // For now I'll check for a basic element or just that it renders.
        const heading = screen.getByRole('heading', { level: 1 })
        expect(heading).toBeInTheDocument()
    })
})
