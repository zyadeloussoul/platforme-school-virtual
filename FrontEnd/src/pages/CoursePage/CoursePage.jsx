import styles from "./CoursePage.module.css";

import { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import ReactPlayer from 'react-player';

//components
import Header from '../../components/Header/Header';
import Footer from '../../components/Footer/Footer';

//utils
import { ratingStars, formatDate } from "../../utils/helpers";

//images
import placeholder from "../../assets/images/placeholder.png";
import profileHolder from "../../assets/images/profile.png";

function CoursesPage() {
  const params = useParams();
  const [id, setId] = useState('');

  const courseData =
  {
    id: 1,
    title: "Introduction à la science de l'environnement",
    price: 499.99,
    category: "Science",
    rating: 5,
    description: "Explorez l'impact des activités humaines sur l'environnement.",
    image: "https://images.pexels.com/photos/6990475/pexels-photo-6990475.jpeg",
    url: "#",
    startDate: "22/05/2024",
    endDate: "21/06/2024",
    instructor: "Ahmed",
    urlVideo: "https://www.youtube.com/watch?v=Znzq_a3nasY",
    quizUrl: "",
  };

  useEffect(() => {
    if (params.id) {
      setId(params.id);
    }
  }, []);

  return (
    <>
      <Header />
      <div className={styles.container}>
        <div className={styles.main}>
          <div className={styles.navPath}>
            <a href="/courses">Courses</a> / <a href={`/courses/${courseData.category}`}>{courseData.category}</a> / <b>{courseData.title}</b>
          </div>
          <div className={styles.courseContainer}>
            <h1>{courseData.title}</h1>
            <p>{courseData.category}</p>
            <img
              className={styles.courseImage}
              src={courseData.image ? courseData.image : placeholder}
              alt="Course Thumbnail"
            />
            <h3>À propos de ce cours</h3>
            <p>{courseData.description}</p>
          </div>
          {courseData.urlVideo &&
            <div className={styles.courseVideo}>
              <h3>Enregistrement vidéo du cours</h3>
              <ReactPlayer
                url={courseData.urlVideo}
                width="100%"
                height="100%"
                controls />
            </div>
          }
        </div>
        <div className={styles.side}>
          {/* Course Info */}
          <div className={styles.enrollCard}>
            <h4>Informations sur le cours</h4>
            <div className={styles.courseRating}>
              {ratingStars(courseData.rating)}
            </div>
            <p><i>{formatDate(courseData.startDate)}</i> à <i>{formatDate(courseData.endDate)}</i></p>
            <p className={styles.coursePrice}>{courseData.price} Dhs</p>
            <button className={styles.courseButton}>S'inscrire à ce cours</button>
          </div>

          {/* Instructor */}
          <div className={styles.intructorCard}>
            <h4>À propos de l’instructeur</h4>
            <div className={styles.intructorInfo}>
              <div className={styles.intructorImageContainer}>
                <img className={styles.intructorImage}
                  src={courseData.instructor.image ? courseData.instructor.image : profileHolder}
                  alt="instructor profile" />
              </div>
              <div>
                <p className={styles.intructorName}>Instructor name</p>
                <p className={styles.intructorTagline}>Instructor departement</p>
              </div>
            </div>
            <p>description about the instructor</p>
          </div>

          {/* Quiz */}
          <div className={styles.quizCard}>
            <h4>Final Quiz</h4>
            <p>Passez cet Quiz pour prouver que vous avez obtenu des informations essentielles de ce cours.</p>
            <a href={courseData.quizUrl} target="_blank">
              <button className={styles.courseButton}>Lancer le quiz</button>
            </a>
          </div>
        </div>
      </div>
      <Footer />
    </>
  )
}

export default CoursesPage