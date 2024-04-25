import styles from './Home.module.css';
import { useState } from 'react';

//images
import girl from "../../assets/images/girl.png";
import curve from "../../assets/images/headline-curve.svg";

//components
import InfoCard from '../InfoCard/InfoCard';

function Home() {

  const data = [
    {
      text: "students",
      value: 10000
    },
    {
      text: "Quality Course",
      value: 20
    },
    {
      text: "Experience Professors",
      value: 10
    }
  ];

  return (
    <div id='home'>
      <div className={styles.container}>
        <div className={styles.info}>
          <div className={styles.title}>
            <h1><span className='green'>Améliorez</span> vos compétences</h1>
            <img src={curve} alt='curve line' />
          </div>
          <h1>de différentes manières</h1>
          <p>Let's take an online course to improve your skills in a different way, you can set your own study time according to your learning speed. So you san study comfortable and absorb tge material easily.</p>
          <div className={styles.buttons}>
            <button>Get Started</button>
          </div>
        </div>
        <div className={styles.image}>
          <img src={girl} alt='girl holding books' />
        </div>
      </div>

      <div className={styles.infoCard}>
        <InfoCard data={data}/>
      </div>
    </div>
  )
}

export default Home
