import styles from "./CoursesPage.module.css";

import { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';

//components
import Header from '../../components/Header/Header';
import Footer from '../../components/Footer/Footer';
import CourseCard from '../../components/CourseCard/CourseCard';

//Temp Data
const categories = [
  "Architecture",
  "Art",
  "Finance",
  "Psychologie",
  "Science",
];

const coursesData = [
  {
    id: 1,
    title: "Introduction à la science de l'environnement",
    price: 499.99,
    category: "Science",
    rating: 5,
    description: "Explorez l'impact des activités humaines sur l'environnement.",
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
    price: 199.99,
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

function CoursesPage() {
  const params = useParams();

  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('All');
  const [minPrice, setMinPrice] = useState(0);
  const [maxPrice, setMaxPrice] = useState(10000);

  const filteredCourses = coursesData.filter((course) => {
    const nameMatches = course.title.toLowerCase().includes(searchTerm.toLowerCase());
    const categoryMatches = selectedCategory === 'All' || course.category === selectedCategory;
    const priceMatches = (course.price >= minPrice && course.price <= maxPrice);
    return nameMatches && categoryMatches && priceMatches;
  });

  useEffect(()=>{
    if(params.category)
    {
      setSelectedCategory(params.category);
    }
  }, []);

  return (
    <>
      <Header />
      <div className={styles.coursesContainer}>
        <div className={styles.filters}>
          <label className={styles.subtitle}>RECHERCHEZ</label>
          <input
            type="search"
            placeholder="Search by course title"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />

          <ul className={styles.categoryList}>
            <label className={styles.subtitle}>CATÉGORIE</label>
            <li className={styles.listItem} onClick={() => setSelectedCategory("All")}><i>All Categories</i></li>
            {categories.map((category, index) => (
              <li className={styles.listItem} key={index} onClick={() => setSelectedCategory(category)}>
                {category}
              </li>
            ))}
          </ul>

          <label className={styles.subtitle}>PRIX (DHS)</label>
          <div className={styles.priceContainer}>
            <input
              type="number"
              placeholder="Max Price"
              value={minPrice}
              onChange={(e) => setMinPrice(e.target.value == '' ? 0 : e.target.value)}
            />
            <p> - </p>
            <input
              type="number"
              placeholder="Max Price"
              value={maxPrice}
              onChange={(e) => setMaxPrice(e.target.value == '' ? 10000 : e.target.value)}
            />
          </div>
        </div>
        <div className={styles.courses}>
          {filteredCourses.map((course) => (
            <CourseCard key={course.id} title={course.title} image={course.image} price={course.price} category={course.category} desctiption={course.description} rating={course.rating} url={course.url} />
          ))}
        </div>
      </div>
      <Footer />
    </>
  )
}

export default CoursesPage