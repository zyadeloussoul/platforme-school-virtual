import React, { useState } from 'react';
import styles from './InstructorForm.module.css';

function InstructorForm({ ADD, CANCEL }) {
  const [instructorData, setInstructorData] = useState({
    name: '',
    profession: '',
    image: '',
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setInstructorData({ ...instructorData, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission (e.g., send data to backend)
    console.log('Instructor data submitted:', instructorData);
    ADD();
  };

  return (
    <div className={styles.container}>
      <div className={styles.card}>
        <h2 className={styles.cardTitle}>Instructeur</h2>
        <form onSubmit={handleSubmit}>
          <input type="text" name="name" placeholder='Prenom et Nom' value={instructorData.name} onChange={handleInputChange} />
          <input type="text" name="profession" placeholder='Profession' value={instructorData.profession} onChange={handleInputChange} />
          <label>
            Image:<br />
            <input type="file" name="image" value={instructorData.image} onChange={handleInputChange} />
          </label>
        </form>
        <div className={styles.cardButtons}>
          <button type="submit" className={styles.cardOK} onClick={handleSubmit}>Ajouter</button>
          {CANCEL &&
            <button className={styles.cardCancel} onClick={CANCEL}>Annuler</button>}
        </div>
      </div>
    </div>
  )
}

export default InstructorForm
