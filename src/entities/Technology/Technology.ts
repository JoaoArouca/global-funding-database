import { v4 } from 'uuid'

class Technology {
  id: string
  name: string

  constructor(props: Omit<Technology, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}

export { Technology }
