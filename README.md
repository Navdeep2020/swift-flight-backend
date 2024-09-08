
# Swift Flight Data Server

Welcome to the **Swift Flight Data Server**! 🚀 This project demonstrates how to build a simple server using Vapor, a powerful Swift-based web framework. This server provides APIs for accessing flight data and detailed flight information.

## Features

- **Flight List API**: Retrieve a list of available flights.
- **Flight Detail API**: Get detailed information for a specific flight.

## Getting Started

Follow these steps to set up and run the Vapor server locally:

### Prerequisites

1. **Homebrew**: Make sure you have Homebrew installed. If not, you can install it from [Homebrew's official website](https://brew.sh/).

2. **Swift**: Ensure Swift is installed on your system. Vapor requires Swift 5.7 or later.

### Installation Steps

1. **Install Vapor**:
   ```bash
   brew tap vapor/homebrew-tap
   brew install vapor
   vapor new MyWebApp
   cd MyWebApp
   vapor build
   vapor run
2. Access the API:
   - Flight List: http://localhost:3000/api/flights
   - Flight Detail: http://localhost:3000/api/flights/{id}
 
