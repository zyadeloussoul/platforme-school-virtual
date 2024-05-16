import React, { useState } from 'react';
import styles from './CategoryForm.module.css';

function CategoryForm({ ADD, CANCEL }) {
  const [category, setCategory] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    // (send data to backend)
    console.log('Category data submitted:', category);
    ADD();
  };

  return (
    <div className={styles.container}>
      <div className={styles.card}>
        <h2 className={styles.cardTitle}>Catégorie</h2>
        <form onSubmit={handleSubmit}>
          <input type="text" name="category" placeholder='Catégorie' value={category} onChange={(e)=>setCategory(e.target.value)} />
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

export default CategoryForm
