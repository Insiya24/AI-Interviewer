# 🤖 AI Interviewer - SDE Intern Position

A production-ready AI-powered interview system that conducts technical and behavioral interviews for Software Development Engineer (SDE) Intern positions using Google's Gemini AI.

## ✨ Features

- **Real-time Video Recording**: WebRTC-based video capture for candidate responses
- **AI-Powered Analysis**: Uses Gemini 1.5 Flash for video understanding and evaluation
- **Dynamic Question Generation**: Generates personalized questions based on candidate introduction
- **Multi-dimensional Scoring**: Evaluates technical skills, problem-solving, and communication
- **Professional UI**: Modern, responsive interface with progress tracking
- **Real-time Feedback**: Immediate evaluation after each answer
- **Comprehensive Reports**: Final interview summary with recommendations

## 🏗️ Architecture

```
├── backend/           # FastAPI server
│   ├── main.py       # Main application with API endpoints
│   ├── requirements.txt
│   └── .env.example  # Environment variables template
└── frontend/         # Web interface
    └── index.html    # Complete frontend application
```

## 🚀 Quick Start

### Prerequisites

- Python 3.8+
- Google Gemini API Key ([Get one here](https://makersuite.google.com/app/apikey))
- Modern web browser with camera/microphone access

### Backend Setup

1. **Navigate to backend directory**:
   ```bash
   cd backend
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Set up environment variables**:
   ```bash
   # Copy the example file
   copy .env.example .env
   
   # Edit .env and add your Gemini API key
   GEMINI_API_KEY=your_actual_api_key_here
   ```

4. **Start the server**:
   ```bash
   python main.py
   ```
   
   The backend will be available at `http://localhost:8000`

### Frontend Setup

1. **Open the frontend**:
   - Navigate to the `frontend` folder
   - Open `index.html` in a modern web browser
   - Allow camera and microphone permissions when prompted

## 📋 API Endpoints

### POST `/analyze_intro`
Analyzes candidate introduction video and generates interview questions.

**Request**: Multipart form with video file
**Response**: 
```json
{
  "name": "Candidate Name",
  "skills": ["Python", "JavaScript", "React"],
  "strengths": ["Problem solving", "Communication"],
  "weaknesses": ["Limited experience with databases"],
  "questions": [
    {
      "id": 1,
      "type": "technical",
      "question": "Explain the difference between array and linked list",
      "category": "data_structures"
    }
  ],
  "session_id": "session_123"
}
```

### POST `/analyze_answer`
Evaluates candidate's answer to a specific question.

**Request**: Multipart form with:
- `video`: Video file
- `session_id`: Session identifier
- `question_id`: Question ID
- `question_text`: The question text

**Response**:
```json
{
  "transcription": "Arrays store elements in contiguous memory...",
  "technical_score": 8,
  "problem_solving_score": 7,
  "communication_score": 9,
  "technical_feedback": "Good understanding of data structures",
  "problem_solving_feedback": "Clear logical approach",
  "communication_feedback": "Well articulated response"
}
```

### POST `/final_evaluation`
Generates comprehensive interview summary.

**Request**: Form data with `session_id`
**Response**:
```json
{
  "avg_technical": 7.5,
  "avg_problem_solving": 8.0,
  "avg_communication": 8.5,
  "overall_score": 8.0,
  "overall_feedback": "Strong technical foundation with excellent communication",
  "recommendation": "Hire - Good performance with minor areas for improvement",
  "total_questions": 5
}
```

## 🎯 Interview Flow

1. **Introduction Phase**:
   - Candidate records 2-minute introduction
   - AI analyzes skills, strengths, and generates personalized questions

2. **Question Phase**:
   - 5-7 questions presented one by one
   - Mix of technical and behavioral questions
   - Real-time evaluation after each answer

3. **Completion Phase**:
   - Final evaluation with aggregated scores
   - Hiring recommendation
   - Comprehensive feedback report

## 🎨 UI Features

- **Progress Tracking**: Visual progress bar and question counter
- **Recording Controls**: Start/stop recording with visual indicators
- **Real-time Feedback**: Immediate scoring and feedback display
- **Responsive Design**: Works on desktop and tablet devices
- **Professional Styling**: Modern gradient design with smooth animations
- **Error Handling**: Graceful handling of API failures and network issues

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the backend directory:

```env
GEMINI_API_KEY=your_gemini_api_key_here
```

### Customization Options

**Question Categories**: Modify the prompt in `/analyze_intro` endpoint to adjust question types:
- Technical: Data structures, algorithms, coding concepts
- Behavioral: Teamwork, problem-solving, learning experiences

**Scoring Criteria**: Adjust evaluation parameters in `/analyze_answer` endpoint:
- Technical accuracy (1-10)
- Problem-solving approach (1-10) 
- Communication clarity (1-10)

**UI Themes**: Modify CSS variables in `index.html` for custom branding:
```css
:root {
  --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  --accent-color: #667eea;
}
```

## 🛡️ Security Considerations

- **API Keys**: Never commit API keys to version control
- **CORS**: Configure specific origins in production (currently set to `*` for development)
- **File Upload**: Implement file size limits and type validation for production
- **Rate Limiting**: Add rate limiting for API endpoints in production

## 🚀 Production Deployment

### Backend Deployment
```bash
# Use production ASGI server
pip install gunicorn
gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
```

### Frontend Deployment
- Serve `index.html` using any web server (nginx, Apache, or CDN)
- Update `API_BASE` constant to point to production backend URL

## 🔍 Troubleshooting

**Camera/Microphone Issues**:
- Ensure browser permissions are granted
- Use HTTPS in production for WebRTC access
- Check browser compatibility (Chrome/Firefox recommended)

**API Connection Issues**:
- Verify backend is running on correct port
- Check CORS configuration
- Ensure Gemini API key is valid and has sufficient quota

**Video Upload Failures**:
- Check file size limits
- Verify network connectivity
- Monitor backend logs for detailed error messages

## 📝 License

This project is for educational and demonstration purposes. Please ensure compliance with Google's Gemini API terms of service when using in production.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

For issues and questions:
- Check the troubleshooting section
- Review API documentation
- Create an issue in the repository

---

**Built with ❤️ using FastAPI, Gemini AI, and modern web technologies**
