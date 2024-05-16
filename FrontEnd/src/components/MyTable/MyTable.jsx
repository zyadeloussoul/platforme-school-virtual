import React from 'react';
import styles from './MyTable.module.css';

const MyTable = ({ data, onEdit, onDelete }) => {
    return (
        <table className={styles.container}>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Catégorie</th>
                    <th>Prix</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {data.map((item) => (
                    <tr key={item.id}>
                        <td>{item.id}</td>
                        <td>{item.title}</td>
                        <td>{item.category}</td>
                        <td>{item.price}</td>
                        <td className={styles.action}>
                            <button onClick={() => onEdit(item)}>Modifier</button>
                            <button className='btn-warning' onClick={() => onDelete(item.id)}>Supprimer</button>
                        </td>
                    </tr>
                ))}
            </tbody>
        </table>
    );
};

export default MyTable;
