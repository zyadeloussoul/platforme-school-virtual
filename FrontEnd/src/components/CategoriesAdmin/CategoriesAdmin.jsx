import styles from "./CategoriesAdmin.module.css";
import { useState } from "react";

//Components
import CategoryTable from "../CategoryTable/CategoryTable";
import CategoryForm from "../CategoryForm/CategoryForm";

const category = [
  "Art",
  "Architecture",
  "Finance",
  "Science",
  "Psychologie",
];

function CategoriesAdmin() {
  const [formOpen, setFormOpen] = useState(false);

  const setScroll = (val)=>{
    document.body.style.overflow = val ? 'scroll' : 'hidden';
  }

  const addCategory = ()=>{
    setScroll(false);
    setFormOpen(true);
  }

  const onAdd = ()=>{
    setScroll(true);
    setFormOpen(false);
  }

  const onCancel = ()=>{
    setScroll(true);
    setFormOpen(false);
  }

  const onDelete = (id) => {
    alert(`Deleting ${id} ...`);
  }

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h3>Categories</h3>
        <button className="btn-v2" onClick={addCategory}>+ Ajouter une catégorie</button>
      </div>
      <div className={styles.body}>
        <CategoryTable data={category} onDelete={onDelete} />
      </div>

      {formOpen && 
        <CategoryForm ADD={onAdd} CANCEL={onCancel}/>
      }
    </div>
  )
}

export default CategoriesAdmin
