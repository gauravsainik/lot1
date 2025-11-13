#!/bin/bash

# DreamRide Lucky Draw - Quick Setup Script
echo "🚀 Setting up DreamRide Lucky Draw..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "Visit: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js found: $(node --version)"

# Setup backend
echo "📦 Setting up backend..."
cd backend

# Install dependencies
echo "Installing backend dependencies..."
npm install

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
    echo "⚠️  Please edit backend/.env with your Razorpay credentials"
fi

# Start backend server in background
echo "🚀 Starting backend server..."
npm start &
BACKEND_PID=$!

# Wait for server to start
sleep 3

# Test backend health
echo "🔍 Testing backend connection..."
if curl -s http://localhost:3000/health > /dev/null; then
    echo "✅ Backend server is running on http://localhost:3000"
else
    echo "❌ Backend server failed to start"
    kill $BACKEND_PID 2>/dev/null
    exit 1
fi

# Setup frontend
echo "🎨 Setting up frontend..."
cd ../frontend

# Check if Python is available for simple HTTP server
if command -v python3 &> /dev/null; then
    echo "🌐 Starting frontend server with Python..."
    echo "✅ Frontend will be available at http://127.0.0.1:5500"
    echo "✅ Backend API running at http://localhost:3000"
    echo ""
    echo "🎯 Next steps:"
    echo "1. Edit backend/.env with your Razorpay credentials"
    echo "2. Configure EmailJS in buy.html (optional)"
    echo "3. Open http://127.0.0.1:5500 in your browser"
    echo ""
    echo "Press Ctrl+C to stop both servers"
    
    # Start frontend server
    python3 -m http.server 5500
else
    echo "🌐 Python not found. Please serve frontend manually:"
    echo "   - Use Live Server extension in VS Code"
    echo "   - Or run: npx http-server -p 5500"
fi

# Cleanup on exit
trap "echo '🛑 Stopping servers...'; kill $BACKEND_PID 2>/dev/null; exit" INT TERM