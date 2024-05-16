import styles from "./CoursesAdmin.module.css";
import { useState } from "react";

//components
import MyTable from "../MyTable/MyTable";
import CourseForm from "../CourseForm/CourseForm";

const coursesData = [
  {
    id: 1,
    title: "Introduction à la science de l'environnement",
    price: 499.99,
    category: "Science",
    rating: 5,
    description: "Explorez l'impact des activités humaines sur l'environnement.",
    image: "https://images.pexels.com/photos/6990475/pexels-photo-6990475.jpeg",
    url: "#",
    startDate: "",
    endDate: "",
    instructor: "",
    urlVideo: "",
    quizUrl: "",
  },
  {
    id: 2,
    title: "Éducation financière et finances personnelles",
    price: 399.99,
    category: "Finance",
    rating: 4,
    description: "Apprenez les compétences financières essentielles pour gérer l'argent et les investissements.",
    image: "https://images.pexels.com/photos/6693661/pexels-photo-6693661.jpeg",
    url: "#",
    startDate: "",
    endDate: "",
    instructor: "",
    urlVideo: "",
    quizUrl: "",
  },
  {
    id: 3,
    title: "Introduction à la psychologie",
    price: 999.99,
    category: "Psychologie",
    rating: 5,
    description: "Découvrez les bases du comportement humain, de la cognition et des processus mentaux.",
    image: "https://images.pexels.com/photos/4101143/pexels-photo-4101143.jpeg",
    url: "#",
    startDate: "",
    endDate: "",
    instructor: "",
    urlVideo: "",
    quizUrl: "",
  },
  {
    id: 4,
    title: "Introduction à l'histoire de l'art",
    price: 199.99,
    category: "Art",
    rating: 4,
    description: "Explorez les mouvements artistiques, les chefs-d'œuvre et les contextes culturels.",
    image: "https://images.pexels.com/photos/375882/pexels-photo-375882.jpeg",
    url: "#",
    startDate: "",
    endDate: "",
    instructor: "",
    urlVideo: "",
    quizUrl: "",
  },
  {
    id: 5,
    title: "Introduction à l'architecture durable",
    price: 879.99,
    category: "Architecture",
    rating: 5,
    description: "Apprenez les principes de la conception et de la construction de bâtiments respectueux de l'environnement.",
    image: "https://images.pexels.com/photos/6416349/pexels-photo-6416349.jpeg",
    url: "#",
    startDate: "",
    endDate: "",
    instructor: "",
    urlVideo: "",
    quizUrl: "",
  },
];

function CoursesAdmin() {
  const [formOpen, setFormOpen] = useState(false);

  const setScroll = (val)=>{
    document.body.style.overflow = val ? 'scroll' : 'hidden';
  }

  const addCourse = ()=>{
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
        <h3>Courses</h3>
        <button className="btn-v2" onClick={addCourse}>+ Ajouter un cours</button>
      </div>
      <div className={styles.body}>
        <MyTable data={coursesData} onEdit={onEdit} onDelete={onDelete} />
      </div>

      {formOpen && 
        <CourseForm ADD={onAdd} CANCEL={onCancel}/>
      }
    </div>
  )
}

export default CoursesAdmin
