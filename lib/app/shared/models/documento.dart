class Documento {
  int id;
  String fileName;
  String filetype;
  int size;
  String fileDownloadUri;
  String hash;
  String data;
  int tipo;
  String titulo;
  String descricao;
  int idUsuario;
  int idDisciplina;

  Documento(
      {this.id,
      this.fileName,
      this.filetype,
      this.size,
      this.fileDownloadUri,
      this.hash,
      this.data,
      this.tipo,
      this.titulo,
      this.descricao,
      this.idUsuario,
      this.idDisciplina});

  Documento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    filetype = json['filetype'];
    size = json['size'];
    fileDownloadUri = json['fileDownloadUri'];
    hash = json['hash'];
    data = json['data'];
    tipo = json['tipo'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    idUsuario = json['idUsuario'];
    idDisciplina = json['idDisciplina'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['filetype'] = this.filetype;
    data['size'] = this.size;
    data['fileDownloadUri'] = this.fileDownloadUri;
    data['hash'] = this.hash;
    data['data'] = this.data;
    data['tipo'] = this.tipo;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['idUsuario'] = this.idUsuario;
    data['idDisciplina'] = this.idDisciplina;
    return data;
  }
}
