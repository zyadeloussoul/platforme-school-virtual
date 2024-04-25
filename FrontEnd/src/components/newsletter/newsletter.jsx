import styles from "./Newsletter.module.css";

function Newsletter() {

  return (
    <div className={styles.container}>
      <div className={styles.background}>
        <h2>Abonnez-vous à notre newsletter</h2>
        <p>Abonnez-vous à notre newsletter pour obtenir des informations sur nos cours.</p>

        <div className={styles.details}>
          <div className={styles.input}>
            <input type="number" name="phone" placeholder="Entrez votre numéro de téléphone"/>
          </div>
          <button>Abonnez-vous</button>
        </div>
      </div>
    </div>
  )
}

export default Newsletter
