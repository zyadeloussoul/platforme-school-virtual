import styles from "./CourseCard.module.css";

//utils
import {ratingStars} from "../../utils/helpers";

//images
import placeholder from "../../assets/images/placeholder.png";

function CourseCard({title, image, price, category, desctiption, rating, url}) {
  const register = (url)=>{
    alert("soon:"+url);
  }
  return (
    <div className={styles.courseCard}>
      <div className={styles.courseDetails}>
        <h3 className={styles.courseTitle}>{title}</h3>
        <p className={styles.courseCategory}>{category}</p>
        <img
          src={image ? image : placeholder}
          alt="Course Thumbnail"
          className={styles.courseImage}
        />
        <p className={styles.coursePrice}>{price} Dhs</p>
        <div className={styles.courseRating}>
          {ratingStars(rating)}
        </div>
        <p className={styles.courseDescription}>
          {desctiption}
        </p>
        <button className={styles.registerButton} onClick={()=>register(url)}>S'inscrire à ce cours</button>
      </div>
    </div>
  )
}

export default CourseCard
