import styles from "./DashboardAdmin.module.css";
import { useState } from "react";

//Components
import StateCard from "../StateCard/StateCard";

//Logos
import AutoStoriesIcon from '@mui/icons-material/AutoStories';
import CategoryIcon from '@mui/icons-material/Category';
import BadgeIcon from '@mui/icons-material/Badge';
import GroupsIcon from '@mui/icons-material/Groups';

function DashboardAdmin() {
  return (
    <div className={styles.container}>
      <h3>Dashboard</h3>
      <div className={styles.body}>
        <StateCard title="Cours" number={6} logo={<AutoStoriesIcon />} color="#328ac1"/>
        <StateCard title="Catégories" number={5} logo={<CategoryIcon />} color="#7e28a6"/>
        <StateCard title="Instructeurs" number={10} logo={<BadgeIcon />} color="#dd9e29"/>
        <StateCard title="Étudiants" number={100} logo={<GroupsIcon />} color="#53c132"/>
      </div>
    </div>
  )
}

export default DashboardAdmin
