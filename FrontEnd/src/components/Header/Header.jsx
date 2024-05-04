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
    "Psychologie"
  ];

  return (
    <div>
      <div className={styles.container}>
        <div className={styles.logo}>
          <a href="#">ZLearning</a>
        </div>

        <div className={styles.list}>
          <ul>
            <li><CustomLink href="#home">Accueil</CustomLink></li>
            <li onMouseEnter={() => setPanelVisible(true)}
                onMouseLeave={() => setPanelVisible(false)}>
                <CustomLink href="/courses">Cours</CustomLink>
            </li>
            <li><CustomLink href="#about">À propos</CustomLink></li>
            <li><CustomLink href="#newsletter">Newsletter</CustomLink></li>
          </ul>
        </div>

        <div className={styles.auth}>
          <button className="btn-v2" onClick={()=>handleNavigate("/login")}>Se connecter</button>
          <button onClick={()=>handleNavigate("/register")}>S’inscrire</button>
        </div>
      </div>

      {/* Courses sub-navbar */}
      {isPanelVisible && (
      <div className={styles.panel}
          onMouseEnter={() => setPanelVisible(true)}
          onMouseLeave={() => setPanelVisible(false)}>
        <ul>
        {category.map((c, index)=>(
          <li key={index}><a href={`/courses/${c}`}>{c}</a></li>
        ))}
        </ul>
      </div>
      )}
    </div>
  )
}

export default Header
