import React, { useState } from 'react';
import styles from './CourseForm.module.css';

function CourseForm({ title, description, ADD, CANCEL }) {
  const [courseData, setCourseData] = useState({
    title: '',
    price: '',
    category: '',
    rating: '',
    description: '',
    image: '',
    url: '',
    startDate: '',
    endDate: '',
    instructor: '',
    urlVideo: '',
    quizUrl: '',
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCourseData({ ...courseData, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission (e.g., send data to backend)
    console.log('Course data submitted:', courseData);
  };

  return (
    <div className={styles.container}>
      <div className={styles.card}>
        <h2 className={styles.cardTitle}>Course</h2>
        <form onSubmit={handleSubmit}>
          <input type="text" name="title" placeholder='Titre' value={courseData.title} onChange={handleInputChange} />
          <textarea name="description" placeholder='Description' value={courseData.description} onChange={handleInputChange} />
          <input type="text" name="price" placeholder='Prix' value={courseData.price} onChange={handleInputChange} />
          <input type="number" name="rating" min="1" max="5" placeholder='Rating' value={courseData.rating} onChange={handleInputChange} />
          <label>
            Category:
            <select name="category" value={courseData.category} onChange={handleInputChange}>
              <option value="web">Web Development</option>
              <option value="design">Design</option>
              <option value="data">Data Science</option>
            </select>
          </label>
          <label>
            Image:<br />
            <input type="file" name="image" value={courseData.image} onChange={handleInputChange} />
          </label>
          <label>
            Start Date:
            <input type="date" name="startDate" value={courseData.startDate} onChange={handleInputChange} />
          </label>
          <label>
            End Date:
            <input type="date" name="endDate" value={courseData.endDate} onChange={handleInputChange} />
          </label>
          <label>
            Instructor:
            <select name="instructor" value={courseData.instructor} onChange={handleInputChange}>
              <option value="ahmed">Ahmed Mohamed</option>
              <option value="yassine">Yassine Elmohssine</option>
              <option value="selma">Selma Nezhari</option>
            </select>
          </label>
          <input type="text" name="urlVideo" placeholder='Video URL' value={courseData.urlVideo} onChange={handleInputChange} />
          <input type="text" name="quizUrl" placeholder='Quiz URL' value={courseData.quizUrl} onChange={handleInputChange} />
        </form>
        <div className={styles.cardButtons}>
          <button className={styles.cardOK} onClick={ADD}>Ajouter</button>
          {CANCEL &&
            <button type="submit" className={styles.cardCancel} onClick={CANCEL}>Annuler</button>}
        </div>
      </div>
    </div>
  )
}

export default CourseForm
