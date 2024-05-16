import styles from "./InstructorsAdmin.module.css";
import { useState } from "react";

//Components
import InstructorTable from "../InstructorTable/InstructorTable";
import InstructorForm from "../InstructorForm/InstructorForm";

const instructorsData = [
  {
    id: 1,
    name: "John Doe",
    profession: "Web Developer",
    image: "https://example.com/john-doe.jpg",
  },
  {
    id: 2,
    name: "Jane Smith",
    profession: "Graphic Designer",
    image: "https://example.com/jane-smith.jpg",
  },
  {
    id: 3,
    name: "Will Moon",
    profession: "Civil Engineer",
    image: "https://example.com/Will-Moon.jpg",
  }
]
function InstructorsAdmin() {
  const [formOpen, setFormOpen] = useState(false);

  const setScroll = (val)=>{
    document.body.style.overflow = val ? 'scroll' : 'hidden';
  }

  const addInstructor = ()=>{
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

  const onEdit = (item) => {
    alert("Updating...\n" + item.title);
  }

  const onDelete = (id) => {
    alert(`Deleting ${id} ...`);
  }

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <h3>Instructeurs</h3>
        <button className="btn-v2" onClick={addInstructor}>+ Ajouter un instructeur</button>
      </div>
      <div className={styles.body}>
        <InstructorTable data={instructorsData} onEdit={onEdit} onDelete={onDelete} />
      </div>

      {formOpen && 
        <InstructorForm ADD={onAdd} CANCEL={onCancel}/>
      }
    </div>
  )
}

export default InstructorsAdmin
