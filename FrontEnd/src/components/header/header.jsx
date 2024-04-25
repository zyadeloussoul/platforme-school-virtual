import styles from "./Header.module.css";
import { useState } from 'react'

//components
import CustomLink from "../CustomLink/CustomLink";

function Header() {

  return (
    <div className={styles.container}>
      <div className={styles.logo}>
        <a href="#">ZLearning</a>
      </div>

      <div className={styles.list}>
        <ul>
          <li><CustomLink href="#home">Home</CustomLink></li>
          <li><CustomLink href="#courses">Courses</CustomLink></li>
          <li><CustomLink href="#about">About</CustomLink></li>
          <li><CustomLink href="#contact">Contact</CustomLink></li>
        </ul>
      </div>

      <div className={styles.auth}>
        <button className="btn-v2">Sign In</button>
        <button>Sign Up</button>
      </div>
    </div>
  )
}

export default Header
