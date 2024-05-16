import styles from "./Header.module.css";
import { useState } from 'react'
import { useNavigate } from "react-router-dom";

//components
import CustomLink from "../CustomLink/CustomLink";

function Header() {
  const [isPanelVisible, setPanelVisible] = useState(false);

  const navigate = useNavigate();

  const handleNavigate = (path) => {
    navigate(path);
  };

  const category = [
    "Art",
    "Architecture",
    "Finance",
    "Science",
    "Psychologie",
  ];

  const coursToggle = (e)=>{
    e.preventDefault();
    setPanelVisible(!isPanelVisible);
  }

  return (
    <div>
      <div className={styles.container}>
        <div className={styles.logo}>
          <a href="/">ZLearning</a>
        </div>

        <div className={styles.list}>
          <ul>
            <li><CustomLink href="/#home">Accueil</CustomLink></li>
            <li onClick={coursToggle}>
                <CustomLink href="">Cours</CustomLink>
            </li>
            <li><CustomLink href="/#about">À propos</CustomLink></li>
            <li><CustomLink href="/#newsletter">Newsletter</CustomLink></li>
          </ul>
        </div>

        <div className={styles.auth}>
          <button className="btn-v2" onClick={()=>handleNavigate("/login")}>Se connecter</button>
          <button onClick={()=>handleNavigate("/register")}>S’inscrire</button>
        </div>
      </div>

      {/* Courses sub-navbar */}
      {isPanelVisible && (
      <div className={styles.panel}>
        {category.map((c, index)=>(
          <a key={index} href={`/courses/${c}`}>{c}</a>
        ))}
      </div>
      )}
    </div>
  )
}

export default Header
