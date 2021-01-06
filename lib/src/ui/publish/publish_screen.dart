import 'package:flutter/material.dart';
import 'package:red_social/src/models/publicacion_model.dart';
import 'package:red_social/src/ui/publish/carousel.dart';
import 'package:weather_icons/weather_icons.dart';

class PublishScreen extends StatefulWidget {
  @override
  _PublishScreenState createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {

  double sliderAmount = 0;
  double sliderWeatherValue = 0;

  final formKey = GlobalKey<FormState>();
  PublicacionModel publicacion = new PublicacionModel(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _titleInput(),
            SizedBox(height: 20),
            _descriptionInput(),
            // _weatherSlider(),
            SizedBox(height: 20),
            _weatherIcons(),  
            _timeSlider(),
            _publishButton()                  
          ],
        )
      ),
    );
  }

  Widget _publishButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.send),      
      onPressed: _submit,
      color: Colors.grey[600],
      label: Text('Publicar'),      
    );
  }
  
  void _submit() {
    formKey.currentState.save();
    print(publicacion.titulo);
    print(publicacion.descripcion);
  }

  Widget _weatherSlider() {
    return Carousel(

    );
  }

  Widget _weatherIcons() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.day_sunny),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.rain),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.tornado),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.tsunami),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.alien),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.cloudy),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.day_cloudy),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.moon_alt_full),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.night_fog),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.strong_wind),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.snow),
              ),
               IconButton(
                onPressed: () =>{}, 
                icon: Icon(WeatherIcons.thunderstorm),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _timeSlider() {    
    return Slider(
      value: sliderAmount,
      onChanged: (newRating) {
        setState(() => sliderAmount = newRating);
      },
      label: 'Tiempo publicado: ' + ((sliderAmount * 1440 )/ 60).toString() + 'hs',
      divisions: 1440,
    );
  }

  Widget _titleInput() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        initialValue: publicacion.titulo,
        onSaved: (value) => publicacion.titulo = value,
        decoration: InputDecoration(
          icon: Icon(Icons.title),
          labelText: 'Título'
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _descriptionInput() {
    return Padding(  
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(      
        initialValue: publicacion.descripcion,
        onSaved: (value) => publicacion.descripcion = value,
        decoration: InputDecoration(
          icon: Icon(Icons.textsms),
          labelText: 'Descripción',        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

