//
//  User.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct User{
    private var allWoman : [Woman]
    private var listOfFavorited : [Woman]
    
    init() {
        let database = ReadingPList()
        allWoman = database.returningData()
        listOfFavorited  = allWoman.filter { $0.saved }
    }
    mutating func addWoman(new: Woman){
        listOfFavorited.append(new)
    }
    mutating func deleteWoman(new: Woman){
        listOfFavorited.removeAll { $0.id == new.id }
    }
    func getListOfFAvorite() -> [Woman] {
        return listOfFavorited
    }
    
    func womanOftheDay() -> Woman{
        return allWoman.first ??
        Woman(name: "Daniela Braghini", date: "24/05/1989", carrer: "Designer", textAbout: "Mãe, esposa, designer, intensa e determinada. Menina do interior que sonhava em aprender Design na “cidade grande”. Aos 18 anos me mudei para a capital catarinense e me matriculei no esperado curso. Me apaixonei pela profissão e os caminhos foram me levando aos estágios, um intercâmbio, o emprego fixo e a formatura. Fiz amizades inspiradoras e me tornei uma mulher decidida e muito otimista. Encontrei o amor verdadeiro em um homem incrível que eu nunca mais larguei. Me mudei para perto dele e recomecei profissionalmente, agora na capital gaúcha. Engravidamos e agora somos três... ♥️ Muita coisa mudou no mundo e em mim e posso dizer que me sinto orgulhosa e feliz com as escolhas que eu fiz. A maternidade sem dúvidas foi a melhor experiência que eu vivenciei até hoje. Foi um universo cheio de novidades, boas e ruins. No fim da minha licença maternidade eu achei que não iria conseguir voltar ao trabalho, amamentar, cuidar de uma criança e continuar a minha profissão. Na época me passou ideias de como eu poderia trabalhar em casa, pensando que não conseguiria levar minha filha na escola com 5 meses, manter a amamentação e todas essas coisas. Apesar dos medos e vontade de desistir eu não queria abrir mão da minha carreira e gostaria de que a minha vida “voltasse ao normal” mesmo com uma filha pequena. Não foi fácil, mas consegui retornar ao trabalho, organizar a rotina de amamentação e os cuidados com a Lorena. Tive sorte de estar em uma empresa que não tem preconceito com mães e de ter um parceiro que realmente assume o papel de pai e marido. Sem isso, tudo teria sido mais difícil. Meu desejo é que todas as mulheres possam fazer suas escolhas com liberdade, assim como fiz as minhas, sem julgamentos e sem padrões pré estabelecidos. Ficar em casa, ir trabalhar, ser mãe, não ser mãe. Que as mulheres possam estar onde elas quiserem, sempre. Compartilho um link de um trabalho realizado em 2016 e que gostei muito de realizar. Trabalhei com estampas e criei produtos com tecido 100% reciclados de garrafas Pet. O ramo de sustentabilidade me interessa bastante e gostei de alinhar design e a sustentabilidade neste projeto. ", image: "DaniBraguini", phrase: "“E de repente, num dia qualquer, acordamos e percebemos que já podemos lidar com aquilo que julgávamos maior que nós mesmos…”", saved: false, id: 0)
    }
}
