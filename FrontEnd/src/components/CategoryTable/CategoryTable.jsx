import React from 'react';
import styles from './CategoryTable.module.css';

const CategoryTable = ({ data, onDelete }) => {
    return (
        <table className={styles.container}>
            <thead>
                <tr>
                    <th>Catégorie</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {data.map((item, index) => (
                    <tr key={index}>
                        <td>{item}</td>
                        <td className={styles.action}>
                            <button className='btn-warning' onClick={() => onDelete(index)}>Supprimer</button>
                        </td>
                    </tr>
                ))}
            </tbody>
        </table>
    );
};

export default CategoryTable;
