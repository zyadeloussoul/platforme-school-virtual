import styles from "./CourseCard.module.css";
import { useNavigate } from "react-router-dom";

//utils
import { ratingStars } from "../../utils/helpers";

//images
import placeholder from "../../assets/images/placeholder.png";

function CourseCard({ courseId, title, image, price, category, desctiption, rating, url }) {
  const navigate = useNavigate();

  const register = (url) => {
    alert("soon:" + url);
  }
  const open = () => {
    navigate(`/courses/${category}/${courseId}`);
  }
  return (
    <div className={styles.courseCard}>
      <div className={styles.courseDetails}>
        <div>
          <h3 className={styles.courseTitle}>{title}</h3>
          <p className={styles.courseCategory}>{category}</p>
        </div>
        <img
          src={image ? image : placeholder}
          alt="Course Thumbnail"
          className={styles.courseImage}
          onClick={() => open(url)}
        />
        <p className={styles.coursePrice}>{price} Dhs</p>
        <div className={styles.courseRating}>
          {ratingStars(rating)}
        </div>
        <p className={styles.courseDescription}>
          {desctiption}
        </p>
        <div className={styles.buttonsContainer}>
          <button className={styles.registerButton} onClick={() => register(url)}>S'inscrire à ce cours</button>
          <button className={styles.detailButton} onClick={() => open(url)}>Détails</button>
        </div>
      </div>
    </div>
  )
}

export default CourseCard
