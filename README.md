# EduXchange_College-Skill-Exchange-Platform
## _Where learning becomes collaboration_ !!!
### Short Introduction
A campus-centric Skill Exchange Platform that enables students to list the skills they can teach, specify the skills they want to learn, and share their available time slots. Using intelligent peer matching, this platform connects learners with suitable peers(mentors) from within the campus. The core idea is to build a collaborative learning ecosystem where every student is both a learner and a mentor, where credits will be earned for teaching and using those credits students can learn other desired courses from their peers promoting accessible learning, peer collaboration, and optimal use of campus skills.

### Problem Statement
Students on campus possess a wide range of valuable skills, yet there is no structured platform to share them effectively. Learners often struggle to identify a peer(mentor) who can teach a specific skill on free time slots or access affordable learning opportunities. As a result, learning frequently depends on paid platforms, leading to underutilization of student talent and limited peer-to-peer collaboration within the campus.

### Tech Stacks:
1. Flutter – UI development
2. Dart – Application logic
3. Flutter Web – Browser‑based deployment
4. FlutLab – Online Flutter environment

### Workflow: 
#### 1. User Registration / Login
  Students sign up or log in to access the platform.

#### 2. Profile Setup
  * Users create their profile by adding:
  * Skills they can teach
  * Skills they want to learn
  * Available time slots

#### 3. Data Storage
  User information is stored securely.
  (Current: JSON-based local storage | Future: Firebase Firestore)

#### 4. Smart Matching
  The system analyzes:
  * Skill compatibility
  * Overlapping free time slots
  
#### 5. Match Generation
  - Best-suited peers are identified using the matching logic.

#### 6. Match Display
  - Matched users are displayed on the dashboard.

#### 7. Skill Exchange Session
  - Students connect and begin peer learning.

#### 8. Feedback & Credit Update (Future Scope)
  - After sessions:

* Users can give feedback
* Ratings are updated
* Credits are adjusted
### Architecture Diagram:
<img width="1028" height="553" alt="image" src="https://github.com/user-attachments/assets/150422f3-6d5a-415e-9488-37b62da5b4ca" />
### Conclusion:
Our platform uniquely enables time‑aware, peer‑to‑peer skill exchange, where students both teach and learn using a credit‑based system—making learning collaborative, flexible, and accessible.


