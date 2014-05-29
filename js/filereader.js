// Generated by CoffeeScript 1.7.1
(function() {
  var handleFileSelect;

  handleFileSelect = function(event) {
    var f, importFiles, output, _i, _len;
    importFiles = event.target.files;
    output = [];
    for (_i = 0, _len = importFiles.length; _i < _len; _i++) {
      f = importFiles[_i];
      output.push('<li><strong>', escape(f.name), '</li>');
    }
    return document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  };

  document.getElementById('files').addEventListener('change', handleFileSelect, false);

}).call(this);

//# sourceMappingURL=filereader.map