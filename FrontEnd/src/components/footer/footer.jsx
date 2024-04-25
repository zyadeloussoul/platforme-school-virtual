import { useState } from 'react';
import styles from "./Footer.module.css";

//images
import instagram from "../../assets/images/icons/instagram.svg";
import github from "../../assets/images/icons/github.svg";
import twitter from "../../assets/images/icons/twitter.svg";
import youtube from "../../assets/images/icons/youtube.svg";

function Footer() {

  return (
    <div className={styles.container}>
      <div className={styles.about}>
        <div className={styles.info}>
          <h2>ZLearning</h2>
          <p>ZLearning est une plateforme d’apprentissage en ligne qui fonctionne depuis 2024 jusqu’à présent.</p>
        </div>
        <div className={styles.social}>
          <ul>
            <li><a href="#"><img src={instagram} alt='instagram'/></a></li>
            <li><a href="#"><img src={github} alt='github'/></a></li>
            <li><a href="#"><img src={twitter} alt='twitter'/></a></li>
            <li><a href="#"><img src={youtube} alt='youtube'/></a></li>
          </ul>
        </div>
      </div>

      <div className={styles.more}>
        <div>
          <h3>Cours</h3>
          <ul>
            <li><a href='#'>Science</a></li>
            <li><a href='#'>Finance</a></li>
            <li><a href='#'>Psychologie</a></li>
            <li><a href='#'>Art</a></li>
            <li><a href='#'>Architecture</a></li>
          </ul>
        </div>
        <div>
          <h3>Menu</h3>
          <ul>
            <li><a href='#home'>Accueil</a></li>
            <li><a href='#courses'>Cours</a></li>
            <li><a href='#about'>À propos</a></li>
          </ul>
        </div>
      </div>
    </div>
  )
}

export default Footer
