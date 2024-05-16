import styles from './AdminPage.module.css';
import { useNavigate, Outlet } from "react-router-dom";

export default function AdminPage() {
  const navigate = useNavigate();

  const handleNavigate = (path) => {
    navigate(path);
  };

  return (
    <div>
      <div className={styles.container}>
        <div className={styles.navbar}>
          <a href="/admin">ZLearning</a>
          <button className="btn-v2" onClick={()=>handleNavigate("/login")}>Logout</button>
        </div>

        <div className={styles.body}>
          <h2>Admin</h2>
          <div className={styles.bodyContainer}>
            <div className={styles.sidebar}>
              <ul>
                <a href="/admin"><li>Dashboard</li></a>
                <a href="/admin/courses"><li>Cours</li></a>
                <a href="/admin/categories"><li>Catégories</li></a>
                <a href="/admin/instructors"><li>Instructeurs</li></a>
              </ul>
            </div>
            {/* outlet */}
            <div className={styles.outlet}>
              <Outlet />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}