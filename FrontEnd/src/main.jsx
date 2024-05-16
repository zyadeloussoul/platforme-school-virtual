import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'
import { createBrowserRouter, RouterProvider } from "react-router-dom";

//Pages
import LoginPage from './pages/LoginPage/LoginPage.jsx';
import RegisterPage from './pages/RegisterPage/RegisterPage.jsx';
import CoursesPage from './pages/CoursesPage/CoursesPage.jsx';
import CoursePage from './pages/CoursePage/CoursePage.jsx';
import ErrorPage from "./pages/ErrorPage/ErrorPage.jsx";
import AdminPage from "./pages/AdminPage/AdminPage.jsx";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    errorElement: <ErrorPage />,
  },
  {
    path: "login",
    element: <LoginPage />,
  },
  {
    path: "register",
    element: <RegisterPage />,
  },
  {
    path: "admin",
    element: <AdminPage />,
  },
  {
    path: "courses",
    element: <CoursesPage />,
  },
  {
    path: "courses/:category",
    element: <CoursesPage />,
  },
  {
    path: "courses/:category/:id",
    element: <CoursePage />,
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)