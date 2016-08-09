<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Josh Harris</title>
  <style type="text/css">
    body {
      padding: 0;
      margin: 0;
    }
    main {
      display: flex;
      flex-wrap: wrap;
    }
    section {
      flex: 0 50%;
      box-sizing: border-box;
      background: #fefefe;
      border-bottom: 2px solid #555;
    }
    section:nth-child(even) {
      background: #f1f1f1;
    }
    h2 {
      color: #fff;
      line-height: 1.5em;
      background: #555;
      padding: 0 2%;
      margin: 0;
    }
    h2 + * {
      display: block;
      box-sizing: border-box;
      padding: 0 2%;
      margin: 0 2%;
    }
    section:nth-child(even)
  </style>
</head>
<body>
  <main>
    <section>
      <h2>Countdown</h2>
      <ul class="countdown"></ul>
    </section>
    <section>
      <h2>Code</h2>
      <pre>
        <?php echo file_get_contents('./ch2-countdown.js'); ?>
      </pre>
    </section>
    <section>
      <h2>Selection Sort</h2>
      <p class="selection-array"></p>
      <ul class="selection-sorted"></ul>
    </section>
    <section>
      <h2>Code</h2>
      <pre>
        <?php echo file_get_contents('./ch2-selection-sort.js'); ?>
      </pre>
    </section>
  </main>
  <script src="ch2-countdown.js"></script>
  <script src="ch2-selection-sort.js"></script>
</body>
</html>
