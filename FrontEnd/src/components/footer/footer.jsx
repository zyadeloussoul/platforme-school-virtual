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
          <p>ZLearning is an online learning platform that has been operating since 2024 until now.</p>
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
          <h3>Courses</h3>
          <ul>
            <li><a href='#'>Genie Civil</a></li>
            <li><a href='#'>Management</a></li>
            <li><a href='#'>Sante</a></li>
          </ul>
        </div>
        <div>
          <h3>Menu</h3>
          <ul>
            <li><a href='#home'>Home</a></li>
            <li><a href='#courses'>Courses</a></li>
            <li><a href='#about'>About</a></li>
          </ul>
        </div>
      </div>
    </div>
  )
}

export default Footer
