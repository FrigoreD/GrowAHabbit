import 'package:flutter/material.dart';

class TextByCreators extends StatelessWidget {
  const TextByCreators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold);
    return AlertDialog(
        content: ListView(physics: const BouncingScrollPhysics(), children: const [
      Text.rich(TextSpan(text: "", children: [
        TextSpan(
          text: 'Ваш доступ к Информации и Контроль над ней:\n',
          style: style,
        ),
        TextSpan(
            text:
                'Вы можете отказаться от любых будущих контактов с нами в любое время. Вы можете сделать следующее в любое время в самом приложении:\n'),
        TextSpan(text: '1. Изменить/исправить любые имеющиеся у нас данные о вас.\n'),
        TextSpan(text: '2. Удалить все имеющиеся данные о вас.\n'),
        TextSpan(
            text: '3. Выражать любые  опасения по поводу использования нами ваших данных.\n\n'),
        TextSpan(
          text: 'Сбор, использование и обмен информацией\n',
          style: style,
        ),
        TextSpan(
            text:
                'Мы являемся единственными владельцами информации, собранной в этом приложении. Мы имеем доступ/собираем только ту информацию, которую вы добровольно предоставляете нам во время регистрации или другим прямым контактом с вами. Мы не передаем вашу информацию третьим лицам за пределами нашей организации. \n\n'),
        TextSpan(
          text: 'Вы можете свободно: \n',
          style: style,
        ),
        TextSpan(
          text: 'Делиться (обмениваться) — ',
          style: style,
        ),
        TextSpan(
            text: 'копировать и распространять материал на любом носителе и в любом формате\n\n'),
        TextSpan(
          text: 'При обязательном соблюдении следующих условий:\n',
          style: style,
        ),
        TextSpan(
          text: '«Attribution» («Атрибуция») —',
          style: style,
        ),
        TextSpan(
            text:
                'Вы должны обеспечить соответствующее указание авторства, предоставить ссылку на лицензию, и обозначить изменения, если таковые были сделаны. Вы можете это делать любым разумным способом, но не таким, который подразумевал бы, что лицензиар одобряет вас или ваш способ использования произведения. \n'),
        TextSpan(
          text: '«NonCommercial» («Некоммерчески») — ',
          style: style,
        ),
        TextSpan(text: 'Вы не вправе использовать этот материал в коммерческих целях. \n'),
        TextSpan(
          text: '«NoDerivatives» («Без производных произведений») - ',
          style: style,
        ),
        TextSpan(
            text:
                'Если вы перерабатываете, преобразовываете материал или берёте его за основу для производного произведения, вы не можете распространять измененный материал. \n\n'),
        TextSpan(
          text: 'Контакты разработчико(Telegram).  \n',
          style: style,
        ),
        TextSpan(text: 'Агапов Александр - @ImgFr1end \n'),
        TextSpan(text: 'Грибанова Валерия - @tearsofsinners \n'),
        TextSpan(text: 'Шатская Александра - @could_be_queerer \n'),
      ])),
    ]));
  }
}
