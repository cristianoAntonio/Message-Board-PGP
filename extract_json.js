const flags = [
  // COLOQUE O JSON AQUI
];

const fs = require('fs');

const stream = fs.createWriteStream("flags.sql");
stream.once('open', function() {
  for (const f in flags) {
    const flag = flags[f];
    const msg = "INSERT INTO flags(name, code, path) VALUES('" +
      flag.name + "','" +
      flag.code + "','" +
      flag.path +
      "');\n";
    stream.write(msg);
  }
  stream.end();
});

