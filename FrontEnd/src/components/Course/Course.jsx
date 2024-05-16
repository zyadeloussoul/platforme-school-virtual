import styles from "./Course.module.css";
import { useState } from 'react'

import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';

//Components
import CourseCard from "../CourseCard/CourseCard";

const responsive = {
  desktop: {
    breakpoint: { max: 3000, min: 1024 },
    items: 3,
    slidesToSlide: 3
  },
  tablet: {
    breakpoint: { max: 1024, min: 464 },
    items: 2,
    slidesToSlide: 2
  },
  mobile: {
    breakpoint: { max: 464, min: 0 },
    items: 1,
    slidesToSlide: 1
  }
};

const courses = [
  {
    id: 1,
    title: "Introduction à la science de l'environnement",
    price: 499.99,
    category: "Science",
    rating: 5,
    description: "Explorez l'impact des activités humaines sur l'environnement pour mieux comprendre les conséquences de nos actions.",
    image: "https://images.pexels.com/photos/6990475/pexels-photo-6990475.jpeg",
    url: "#",
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
  },
  {
    id: 4,
    title: "Introduction à l'histoire de l'art",
    price: 399.99,
    category: "Art",
    rating: 4,
    description: "Explorez les mouvements artistiques, les chefs-d'œuvre et les contextes culturels.",
    image: "https://images.pexels.com/photos/375882/pexels-photo-375882.jpeg",
    url: "#",
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
  },
];

function Course() {

  return (
    <div id="courses" className={styles.container}>
      <div className={styles.title}>
        <h2>Cours les plus populaires</h2>
        <p>“Un apprentissage fluide pour tous, où que vous soyez” 🌐</p>
      </div>

      <Carousel responsive={responsive}>
        {courses.map((course) => (
          <div key={course.id} className={styles.courseCardWrapper}>
            <CourseCard title={course.title} desctiption={course.description}
              price={course.price} category={course.category} rating={course.rating} image={course.image} url={course.url} />
          </div>
        ))}
      </Carousel>
    </div>
  )
}

export default Course
